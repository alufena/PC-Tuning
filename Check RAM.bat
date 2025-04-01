wmic MEMORYCHIP get BankLabel, Capacity, DeviceLocator, MemoryType, TypeDetail, Speed
systeminfo | findstr /C:"Total Physical Memory"
systeminfo |find "Available Physical Memory"
timeout 8
exit