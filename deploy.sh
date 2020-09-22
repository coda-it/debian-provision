if [ ! -z "$WEBAPP_V"  ]
then
        sudo docker pull oszura/webapp-prod:$WEBAPP_V
        sudo docker rm -f $(sudo docker ps -a -q)
        sudo docker run -v /home/oskarszura/db:/data/db -d --network=host mongo
        sudo docker run -e WEBAPP_HTTP_PORT=80 -d --network=host   oszura/webapp-prod:$WEBAPP_V
        curl -X POST -H "Content-type: application/json" --data "{\"text\":\"webapp $WEBAPP_V deployed\"}" "NOTIFICATION_URL"
fi
