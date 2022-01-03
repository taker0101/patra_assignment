terraform {
    
    backend "s3" {
        bucket = "tf-remote-mybkt"
        key = "project/patra"
        region = "us-east-1"
        dynamodb_table = "mystate-dynamodb"
    }
}
