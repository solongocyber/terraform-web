locals {
    name = "aws-${var.stage}-${var.env}-${var.project}-rtype"
    common_tags = {
        env = "var.env"
        region = "var.region"
        stage = "var.stage"
        project = "var.project"
    }
}