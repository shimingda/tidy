#fastdfs总结

##相关指令

```
服务重启storage
  ldd /usr/bin/fdfs_storaged 
  ll /usr/local/lib/libfastcommon.so
  ll /usr/lib/libfastcommon.so
  rm -rf /usr/local/lib/libfastcommon.so.1
  ldd /usr/bin/fdfs_storaged
  /usr/bin/fdfs_storaged /etc/fdfs/storage.conf restart

服务重启tracker
   ldd /usr/bin/fdfs_trackerd 
   ll /usr/local/lib/libfastcommon.so
   ll /usr/lib/libfastcommon.so
   rm -rf /usr/local/lib/libfastcommon.so.1
   ldd /usr/bin/fdfs_trackerd 
   /usr/bin/fdfs_trackerd /etc/fdfs/tracker.conf restart
   
上传图片命令
   /usr/bin/fdfs_upload_file  /etc/fdfs/client.conf /usr/local/4.jpg
```

