resource "aws_db_instance" "database" {
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t2.micro"
    port = 3306
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    db_subnet_group_name = "${aws_db_subnet_group.default.id}"
    name = "mydb"
    identifier = "mysqldb"
    username = "myuser"
    password = "mypassword"
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot = true
    tags = {
        Name = "database"
    }
}

