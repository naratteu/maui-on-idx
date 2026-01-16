# maui-on-idx

`Firebase Studio`에 현 저장소를 [Import](https://idx.google.com/import)합니다. (안드로이드 개발옵션 체크 필요)

임포트 완료후 IDE상에서 앱 실행까지 자동으로 완료되어야 합니다.

## Troubleshooting

### [No space left on device : '/home/user/...](https://firebase.google.com/docs/studio/troubleshooting#no-space-home)

```bash
du -sh /home/user # 20G     /home/user
ls /home/user # flutter  maui-on-idx  myapp
rm -rf /home/user/flutter
rm -rf /home/user/myapp
du -sh /home/user # 16G     /home/user
```
