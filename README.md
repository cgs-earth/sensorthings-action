# SensorThings API demp server
[![Build](https://github.com/cgs-earth/sensorthings-action/actions/workflows/main.yml/badge.svg)](https://github.com/cgs-earth/sensorthings-action/actions/workflows/main.yml)

This action runs a SensorThings API services using the [FROST-Server](https://github.com/FraunhoferIOSB/FROST-Server).
This is not meant to be used for unit testing only.

## Inputs

## `table`

**Required** The sensorthings table name. Note: The `sensorthings` table is used to house demo data.

## `username`

**Required** The database user name.

## `passsword`

**Required** The database user name.

## Outputs

## `None`

The SensorThings API endpoint is availble at http://localhost:8888/FROST-Server.

## Example usage

uses: actions/sensorthings-action
