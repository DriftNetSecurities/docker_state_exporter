aws-login:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 089757678707.dkr.ecr.us-east-1.amazonaws.com

dev:
	docker buildx build --platform linux/amd64 -o type=docker -t docker-state-exporter-dev .
	docker tag docker-state-exporter-dev:latest 089757678707.dkr.ecr.us-east-1.amazonaws.com/docker-state-exporter-dev:latest
	docker push 089757678707.dkr.ecr.us-east-1.amazonaws.com/docker-state-exporter-dev:latest

staging:
	docker buildx build --platform linux/amd64 -o type=docker -t docker-state-exporter .
	docker tag docker-state-exporter:latest 089757678707.dkr.ecr.us-east-1.amazonaws.com/docker-state-exporter:latest
	docker push 089757678707.dkr.ecr.us-east-1.amazonaws.com/docker-state-exporter:latest
