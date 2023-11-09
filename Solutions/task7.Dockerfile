# Use the centos 7 base image
FROM centos:7

# Add your maintainer info
MAINTAINER Tess Sluijter-Stek spam@spam.spam

# Create a user named duffman
RUN useradd -m duffman

# Install epel-release and mosquitto (epel-release must be installed first)
RUN yum install -y epel-release && yum install -y mosquitto

# Create the colors directory from colors.tar
ADD colors.tar /

# Move skeeter.sh over to /skeeter.sh
COPY skeeter.sh /skeeter.sh

# Make skeeter.sh executable
RUN chmod 755 /skeeter.sh

# Allow connections to port 1883
EXPOSE 1883

# Switch to the duffman user
USER duffman

# Run the skeeter.sh script
ENTRYPOINT ["/skeeter.sh"]