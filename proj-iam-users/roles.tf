locals {
  role_policies = {
    readonly  = ["ReadOnlyAccess"]
    admin     = ["AdministratorAccess"]
    auditor   = ["SecurityAudit"]
    developer = ["AmazonVPCFullAccess", "AmazonS3FullAccess", "AmazonRDSFullAccess", "AmazonEC2FullAccess"]
  }

  role_policies_list = flatten([
    for role, policies in local.role_policies : [
      for policy in policies : {
        role   = role
        policy = policy
      }
    ]
  ])
}

/*
1. We must iterate over the existing roles and create a different assume role policy for each role.
2. In each role policy, under identifiers add only the users that have that
   specific role.
*/

data "aws_iam_policy_document" "assume_role_policy" {
  for_each = toset(keys(local.role_policies))
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "AWS"
      identifiers = [
        for username in keys(aws_iam_user.users) : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${username}"
        if contains(local.users_map[username], each.value)
      ]
    }
  }
}

resource "aws_iam_role" "roles" {
  for_each = toset(keys(local.role_policies))

  name               = each.key
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[each.value].json
}

resource "aws_iam_role_policy_attachment" "role_policy_attachments" {
  count = length(local.role_policies_list)

  role = aws_iam_role.roles[
    local.role_policies_list[count.index].role
  ].name

  policy_arn = data.aws_iam_policy.managed_policies[
    local.role_policies_list[count.index].policy
  ].arn
}
