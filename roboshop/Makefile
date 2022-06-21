#!/bin/bash
help:
	@grep '####' makefile | grep -v grep | sed -e 's/####//'

cart: #### setup Cart Component
	@sudo bash components/cart.sh

catalogue: #### setup catalogue Component
	@sudo bash components/catalogue.sh

user:  #### setup user Component
	@sudo bash bash components/user.sh

shipping: #### setup Shipping Component
	@sudo bash components/shipping.sh

payment: #### setup payment Component
	@sudo bash components/payment.sh

frontend: #### setup frontend Component
	@sudo bash components/frontend.sh

mysql:  #### setup mysql Component
	@sudo bash bash components/mysql.sh

redis: #### setup redis Component
	@sudo bash components/redis.sh

rabbitmq: #### setup rabbitmq Component
	@sudo bash components/rabbitmq.sh

mongodb: #### setup mongodb Component
	@sudo bash components/mongodb.sh

## target
    ## rules