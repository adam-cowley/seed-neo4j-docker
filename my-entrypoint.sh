echo "Running Backup & Restore from:"
echo $PRODUCTION
echo ""

neo4j-admin backup --from=$PRODUCTION --backup-dir=/backup 
neo4j-admin restore --from=/backup/neo4j --database=neo4j --force

chown -R neo4j:neo4j /data

exec /docker-entrypoint.sh $*
