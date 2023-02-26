import asyncio
import datetime
import algorithim_pb2
from bleak import BleakClient, BleakScanner


MESSAGING_HOST_OUTPUT_STREAM_UUID = "23464575-3164-4dcb-b200-602ebd7cd3f0"
MESSAGING_HOST_INPUT_STREAM_UUID = "a241328d-fd06-4475-a31a-26328d92eba2"

OTA_DATA_UUID = '23408888-1F40-4CD8-9B89-CA8D45F8A5B0'
OTA_CONTROL_UUID = '7AD671AA-21C0-46A4-B722-270E3AE3D830'
APPLY_UPDATE_UUID = '3e33db7b-9108-4549-b063-979f55610f0f'


SVR_CHR_OTA_CONTROL_NOP = bytearray.fromhex("00")
SVR_CHR_OTA_CONTROL_REQUEST = bytearray.fromhex("01")
SVR_CHR_OTA_CONTROL_REQUEST_ACK = bytearray.fromhex("02")
SVR_CHR_OTA_CONTROL_REQUEST_NAK = bytearray.fromhex("03")
SVR_CHR_OTA_CONTROL_DONE = bytearray.fromhex("04")
SVR_CHR_OTA_CONTROL_DONE_ACK = bytearray.fromhex("05")
SVR_CHR_OTA_CONTROL_DONE_NAK = bytearray.fromhex("06")

SRV_CHR_APPLY_UPDATE_SUCCESS = bytearray.fromhex("00")
SRV_CHR_APPLY_UPDATE_FAIL = bytearray.fromhex("01")
SRV_CHR_APPLY_UPDATE_NONE_ATTEMPTED = bytearray.fromhex("02")

global waitForResult
waitForResult = False

# now we should tell the svr switch partitions and reboot :)
def _app_update_notificationHAndler(sender: int, data: bytearray):
    # decide what to do
    if data == SRV_CHR_APPLY_UPDATE_NONE_ATTEMPTED:
        print("None update has been attempted :(")
    if data == SRV_CHR_APPLY_UPDATE_FAIL:
        print("the update failed")
    if data == SRV_CHR_APPLY_UPDATE_SUCCESS:
        print("Update Applied Succesfully")
    global waitForResult
    waitForResult = True

async def _search_for_esp32():
    print("Searching for ESP32...")
    esp32 = None

    devices = await BleakScanner.discover()
    for device in devices:
        if device.name == "esp32":
            esp32 = device

    if esp32 is not None:
        print("ESP32 found!")
    else:
        print("ESP32 has not been found.")
        assert esp32 is not None

    return esp32


async def send_ota(file_path):
    esp32 = await _search_for_esp32()
    async with BleakClient(esp32) as client:

        # async def _ota_notification_handler(sender: int, data: bytearray):
        #     if data == SVR_CHR_OTA_CONTROL_REQUEST_ACK:
        #         print("ESP32: OTA request acknowledged.")
        #         await queue.put("ack")
        #     elif data == SVR_CHR_OTA_CONTROL_REQUEST_NAK:
        #         print("ESP32: OTA request NOT acknowledged.")
        #         await queue.put("nak")
        #         await client.stop_notify(OTA_CONTROL_UUID)
        #     elif data == SVR_CHR_OTA_CONTROL_DONE_ACK:
        #         print("ESP32: OTA done acknowledged.")
        #         await queue.put("ack")
        #         await client.stop_notify(OTA_CONTROL_UUID)
        #     elif data == SVR_CHR_OTA_CONTROL_DONE_NAK:
        #         print("ESP32: OTA done NOT acknowledged.")
        #         await queue.put("nak")
        #         await client.stop_notify(OTA_CONTROL_UUID)
        #     else:
        #         print(f"Notification received: sender: {sender}, data: {data}")

        # # subscribe to OTA control
        # await client.start_notify(
        #     OTA_CONTROL_UUID,
        #     _ota_notification_handler
        # )

        # compute the packet size
        packet_size = 'hello you dumb fuck'


        endAlgorithim = algorithim_pb2.Timed()
        endAlgorithim.duration = 300

        newAlgorithim = algorithim_pb2.AlgorithimConfiguration()
        newAlgorithim.endAlgorithim = endAlgorithim


        newAlgorithimString = newAlgorithim.SerializeToString()
        print(newAlgorithimString)

        print(newAlgorithim.ParseFromString(newAlgorithimString))

        # write the packet size to OTA Data
        print(f"Sending packet size: {packet_size}.")
        await client.write_gatt_char(
            MESSAGING_HOST_INPUT_STREAM_UUID,
            exercise.SerializeToString(),
            response=True
        )

        await asyncio.sleep(10)

        # # split the firmware into packets
        # with open(file_path, "rb") as file:
        #     while chunk := file.read(packet_size):
        #         firmware.append(chunk)

        # # write the request OP code to OTA Control
        # print("Sending OTA request.")
        # await client.write_gatt_char(
        #     OTA_CONTROL_UUID,
        #     SVR_CHR_OTA_CONTROL_REQUEST
        # )

        # # wait for the response
        # await asyncio.sleep(1)
        # if await queue.get() == "ack":

        #     # sequentially write all packets to OTA data
        #     for i, pkg in enumerate(firmware):
        #         print(f"Sending packet {i+1}/{len(firmware)}.")
        #         # if we are writing a bunch of data, set response to false and havea worker mechanisim
        #         # client responds periodically to a service with details on how much data has been received :)
        #         # this coulld also speed up OTA consideraby 
        #         await client.write_gatt_char(
        #             OTA_DATA_UUID,
        #             pkg,
        #             response=True
        #         )

        #     # write done OP code to OTA Control
        #     print("Sending OTA done.")
        #     await client.write_gatt_char(
        #         OTA_CONTROL_UUID,
        #         SVR_CHR_OTA_CONTROL_DONE
        #     )

        #     # wait for the response
        #     await asyncio.sleep(1)
        #     if await queue.get() == "ack":
        #         dt = datetime.datetime.now() - t0
        #         print(f"OTA successful! Total time: {dt}")





        #         # subscribe to app update 
        #         await client.start_notify(
        #             APPLY_UPDATE_UUID,
        #             _app_update_notificationHAndler
        #         )

        #         # write to the char to start the update!
        #         await client.write_gatt_char(APPLY_UPDATE_UUID, bytearray.fromhex("00"))
        #         # await asyncio.sleep(2)

        #         while (waitForResult):
        #             print("waiting for result...")                
        #             asyncio.sleep(10)
                

        #     else:
        #         print("OTA failed.")

        # else:
        #     print("ESP32 did not acknowledge the OTA request.")


if __name__ == '__main__':
    asyncio.run(send_ota("esp.bin"))
