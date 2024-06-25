#!/bin/bash

qdbus org.kde.ActivityManager /ActivityManager/Activities org.kde.ActivityManager.Activities.StopActivity $(qdbus org.kde.ActivityManager /ActivityManager/Activities org.kde.ActivityManager.Activities.CurrentActivity)
