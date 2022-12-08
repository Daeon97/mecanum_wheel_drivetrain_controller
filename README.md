# mecanum_wheel_drivetrain_controller

Mobile app interface for controlling a mecanum wheel drivetrain using both BLoC and Cubit for state
management. The app communicates with a local MQTT server that we have set up here in Innov8 Hub.
Using the publish/subscribe model, messages are published to specific topics which the drivetrain
subscribes to and adjusts its movement with respect to these messages. You can read more on MQTT
at https://www.hivemq.com/mqtt-essentials/
