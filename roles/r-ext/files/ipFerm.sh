#!/bin/bash

ip a show dev enp0s9|grep "inet "|cut -d/ -f1 | cut -dt -f2
