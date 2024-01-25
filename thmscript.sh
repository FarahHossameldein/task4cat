#!/bin/bash

# Connect using Warp and check assigned IP
warp-cli connect
sleep 5  # Wait for the connection to establish
assigned_ip=$(curl -s https://ipinfo.io/ip)
if [[ -z $assigned_ip ]]; then
    echo "Failed to obtain assigned IP. Exiting..."
    exit 1
fi
echo "Connected using Warp. Assigned IP: $assigned_ip"

# Connect using OpenVPN in the background
sudo openvpn --config /home/farah/Downloads/farahhosam620.ovpn --daemon
sleep 5  # Wait for the connection to establish

# Check connection with assigned IP
connected_ip=$(curl -s https://ipinfo.io/ip)
if [[ $connected_ip != $assigned_ip ]]; then
    echo "Failed to connect using OpenVPN. Exiting..."
    
    exit 1
fi
echo "Connected using OpenVPN. Assigned IP: $connected_ip"

# Perform a ping test
ping -c 3 10.10.10.10

# Disconnect from Warp
warp-cli  disconnect
