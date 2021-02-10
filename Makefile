.PHONY: git
git:
	git add .
	git commit -m"自动提交 git 代码"
	git push
tag:
	git push --tags
.PHONY: helm
helm:
	helm push charts/ 133553-lecex
.PHONY: run
run:
	docker-compose -f docker/docker-compose.yml --env-file docker/.env  up -d
dev:
	docker-compose -f docker/docker-compose.yml --env-file docker/.env  up --build