Premier démarrage:

```
docker-compose run --rm front yarn
docker-compose run --rm api bash
bundle
rails db:setup
exit

docker-compose up
```
