resource "aws_sns_topic" "server_down_notification" {
  name = "ApplicationServerDown"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.server_down_notification.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.send_email_lambda.arn
}

resource "aws_sns_topic_policy" "notify_topic_policy" {
  arn = aws_sns_topic.server_down_notification.arn

  policy = <<POLICY
  {
  "Version": "2008-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__default_statement_ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "SNS:Publish",
        "SNS:RemovePermission",
        "SNS:SetTopicAttributes",
        "SNS:DeleteTopic",
        "SNS:ListSubscriptionsByTopic",
        "SNS:GetTopicAttributes",
        "SNS:AddPermission",
        "SNS:Subscribe"
      ],
      "Resource": "${aws_sns_topic.server_down_notification.arn}",
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "${var.iam_number}"
        }
      }
    }
  ]
}
    POLICY
}