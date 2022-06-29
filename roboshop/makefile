#!/bin/bash
help:
	@grep '####' makefile | grep -v grep | sed -e 's/####//'

git-pull #### setup Cart Component
	@git pull &>/dev/null

cart: git-pull #### setup Cart Component
	@sudo bash components/cart.sh

catalogue: git-pull #### setup catalogue Component
	@sudo bash components/catalogue.sh

user: git-pull  #### setup user Component
	@sudo bash bash components/user.sh

shipping: git-pull #### setup Shipping Component
	@sudo bash components/shipping.sh

payment: git-pull #### setup payment Component
	@sudo bash components/payment.sh

frontend: git-pull #### setup frontend Component
	@sudo bash components/frontend.sh

mysql: git-pull  #### setup mysql Component
	@sudo bash bash components/mysql.sh

redis: git-pull #### setup redis Component
	@sudo bash components/redis.sh

rabbitmq: git-pull #### setup rabbitmq Component
	@sudo bash components/rabbitmq.sh

mongodb: git-pull #### setup mongodb Component
	@sudo bash components/mongodb.sh

## target
    ## rules