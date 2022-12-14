# mecanum_wheel_drivetrain_controller

Mobile app interface for controlling a mecanum wheel drivetrain IOT device using both BLoC and Cubit
for State Management. The app communicates with the target IOT device via bluetooth or Wifi. In
bluetooth mode, data is sent directly to the target IOT device via bluetooth channels after a
successful bluetooth connection. In Wifi mode, data is sent to a local MQTT server that we have set
up here in Innov8 Hub. Using the publish/subscribe model of communication, messages are published to
specific topics which the drivetrain subscribes to and adjusts its movement with respect to these
messages. You can read more on the MQTT protocol at https://www.hivemq.com/mqtt-essentials/
