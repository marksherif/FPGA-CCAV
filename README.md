# Automated Color Controlled RC Car

This project is, as the title suggests, an automated RC car that directs its movements based on the colors benath it, it has 3 basic movements, forwards, right and left

  | Color | Movement |
| ------ | ------ |
| Blue | Forward |
| White | Right |
| Yellow | Left |
| Not the Above | Halt |

The car also utilizes an ultrasonic sensor for collision detection and halting the car from any movement!

# Stuff you'll need to get this up and running

  - FPGA
  - TCS3200 Color Sensor
  - HCSR04 Ultrasonic Sensor
  - H-Bridge to control the motors

You'll probably also need these:
  - [ModelSim-Altera](https://www.intel.com/content/www/us/en/programmable/downloads/software/modelsim-starter/121.html) to compile and run the project on the FPGA
  - [TCS3200](https://www.mouser.com/catalog/specsheets/TCS3200-E11.pdf) datasheet
  - [HCSR04](https://cdn.sparkfun.com/datasheets/Sensors/Proximity/HCSR04.pdf) datasheet

