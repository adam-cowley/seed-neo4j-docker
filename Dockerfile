FROM neo4j:enterprise

# Set Environment Variables
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT yes
ENV NEO4J_dbms_directories_data /data

# Copy over my-entrypoint.sh and give it execute permissions
COPY my-entrypoint.sh /my-entrypoint.sh
RUN chmod +x /my-entrypoint.sh

# Overwrite the docker entrypoint
ENTRYPOINT ["/sbin/tini", "-g", "--", "/my-entrypoint.sh"]

# Run the neo4j command
CMD ["neo4j"]