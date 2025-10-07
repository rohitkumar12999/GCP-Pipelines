# Use node:19.7.0-alpine as the base image
FROM node:19.7.0-alpine

# Set environment variable
ENV NODE_ENV=production

# Create a directory called 'labone'
RUN mkdir /labone

# Change ownership to the node user and node group
RUN chown -R node:node /labone

# Set 'labone' as the working directory
WORKDIR /labone

# Set user to 'node'
USER node

# Copy all source files and change ownership to node
COPY --chown=node:node . .

# Install node.js packages
RUN npm install

# Expose port 3000
EXPOSE 3000

# Set the default command to run your application
CMD ["node", "src/index.js"]
