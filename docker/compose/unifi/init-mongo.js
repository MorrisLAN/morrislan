db.getSiblingDB("UNIFI").createUser({user: "UNIFI", pwd: "${{ secrets.UNIFI_DB_PASS }}", roles: [{role: "dbOwner", db: "UNIFI"}]});
db.getSiblingDB("UNIFI_stat").createUser({user: "UNIFI", pwd: "${{ secrets.UNIFI_DB_PASS }}", roles: [{role: "dbOwner", db: "UNIFI_stat"}]});