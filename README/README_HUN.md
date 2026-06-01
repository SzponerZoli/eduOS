[🇬🇧](../README.md)
 # eduOS
Egy Universal Blue-n alapuló, Linux-disztribúció.

 ## Miért az eduOS?
Ahol én lakom (Magyarországon), sok iskolában elavult számítógépeket használnak, amelyek nem képesek futtatni a Windows 11-et. Az eduOS automatikus frissítéseket, jó teljesítményt és az oktatásban hasznos szoftvereket kínál. Az eduOS célja, hogy ingyenes, nyílt forráskódú és könnyen kezelhető alternatívát nyújtson.

## Jellemzők

- 🔒 Változatlan alap — a diákok nem tudják tönkretenni a rendszert
- 🔄 Automatikus frissítések bootc image letöltések és Flatpak segítségével
- 📦 Profilalapú szoftvercsomagok Flatpak segítségével
- 🛠️ YAML-alapú testreszabás IT-rendszergazdák számára
- 💻 Két asztali környezet — KDE Plasma (modern hardver) és Cinnamon (régebbi hardver)

## Hogyan működik
Az eduOS az Universal Blue-ra épül, 
ahol a rendszerfájlok csak olvashatók. Ez azt jelenti, hogy a diákok véletlenül sem 
törhetik meg az operációs rendszert — újraindításkor minden visszatér a normális állapotba.

A frissítéseket konténerképek formájában szállítják a bootc-n keresztül, hasonlóan ahhoz, ahogyan a telefonok 
kapják az OTA-frissítéseket. Az IT-rendszergazdáknak soha nem kell manuálisan frissíteniük az egyes 
gépeket.

A szoftverek Flatpakon keresztül érkeznek, sandboxolt és profilspecifikus formában. Minden géptípus 
csak a számára szükséges szoftvereket kapja meg, így a rendszer a régebbi hardverekre is könnyedén fut.

## Ki szeretném próbálni
hamarosan elérhető

## Profilok

| Profil | Cél | Főbb szoftverek |
|---|---|---|
| **Alap** | Minden gép | Böngésző, fájlkezelő, szövegszerkesztő, PDF-olvasó, médialejátszó |
| **Diák** | Diákok számítógépei a informatikatermekben | Irodai csomag, grafikus segédprogramok, programozási eszközök |
| **Tanári** | Tanárok számítógépei a infoematikatermekben | A Diák profil összes eleme + diákgép-kezelő szoftver, okostábla-szoftver |
| **Prezentációs** | Projektor/táblagépek | A Diák profil összes eleme + okostábla-szoftver |

## Változatok

- eduOS — KDE Plasma, 2015-től gyártott hardverekhez ajánlott
- eduOS Lite — Cinnamon, régebbi/gyengébb hardverekhez ajánlott

## Testreszabás

A Rendszergazdák egy egyszerű YAML-fájl segítségével testreszabhatják a telepített Flatpakokat:

```yaml
extra-flatpaks:
  - org.example.App
  - org.example.App2
```
## Útiterv
hamarosan

## Állapot

🚧 Jelenleg a fejlesztés korai szakaszában van. Még nem alkalmas termelési használatra.

## Hozzájárulás

Örömmel fogadjuk a hozzájárulásokat! Kérjük, először [írjon nekem e-mailt](mailto:szponerzolidev@proton.me) vagy [nyisson meg egy problémát ](https://github.com/SzponerZoli/eduOS/issues/new), hogy megbeszéljük a változtatásokat.

## Licenc

Apache 2.0