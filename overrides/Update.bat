@echo off
mklink /j guirequired .\config\fancymenu\assets
echo ��ӭʹ��MineOptimiz Updater
echo 1.���ز������ȶ���
echo 2.���ز����²��԰�
echo 3.�˳�
set /p update=
if "%update%"=="3" exit
echo ��ȷ��Minecraft���ڹر�״̬
echo �������ظ��°�
if "%update%"=="1"  .\guirequired\Update\update-stable-download.bat
if "%update%"=="2" .\guirequired\Update\aria2\aria2c.exe -o Update.zip https://nightly.link/SmallMushroom-offical/MineOptimiz-Next/workflows/main/1.20.1-Dev
if errorlevel 1 (
  echo ����ʧ�ܣ�
  pause
  exit /b 1
)
echo �������
echo ���ڽ�ѹ���°�
.\guirequired\Update\7z\7z.exe x Update.zip
del Update.zip
ren *.zip Update.zip
.\guirequired\Update\7z\7z.exe x Update.zip -o".\Update"
if errorlevel 1 (
  echo ��ѹʧ�ܣ�
  pause
  exit /b 1
)
echo ��ѹ���
echo ����ɾ���ɵ��ļ�
rd /s /q config
rd /s /q CustomSkinLoader
rd /s /q mods
rd /s /q resourcepacks
if errorlevel 1 (
  echo ɾ��ʧ�ܣ�
  pause
  exit /b 1
)
echo ɾ�����
echo ���ڸ����µ��ļ�
xcopy .\Update\overrides\config .\config /E /H /I
xcopy .\Update\overrides\CustomSkinLoader .\CustomSkinLoader /E /H /I
xcopy .\Update\overrides\mods .\mods /E /H /I
xcopy .\Update\overrides\resourcepacks .\resourcepacks /E /H /I
if errorlevel 1 (
  echo ����ʧ�ܣ�
  pause
  exit /b 1
)
echo ������ɣ�
echo ����ɾ������
rd /s /q guirequired
rd /s /q Update
del Update.zip
if errorlevel 1 (
  echo ɾ��ʧ�ܣ�
  echo �´θ��¿��ܻ������
)
echo ������ɣ�
echo ������Minecraft�Բ鿴����
pause