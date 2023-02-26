
#ifndef BLUETOOTH_H_

#ifdef __cplusplus
extern "C"
{
#endif
    typedef struct
    {
        char *buffer;
        int bufferLength;

    } messageBuffer;

    void bluetooth_init();
    void notify_message_ready();
#ifdef __cplusplus
}
#endif

#endif // !BLUETOOTH_API_H_