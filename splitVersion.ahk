;==============================================================
; splitVersion — Splits a semantic version string into major/minor/patch/prerelease/buildmetadata parts
;
; GitHub: https://github.com/SevenKeyboard/split-version
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;==============================================================
splitVersion(version, &major:="", &minor:="", &patch:="", &prerelease:="", &buildmetadata:="")    {
    static needleRegEx:="^(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\.(?P<patch>0|[1-9]\d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetadata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"
    major:= minor:= patch:= prerelease:= buildmetadata:= ""
    if (regExMatch(version, needleRegEx, &m))    {
        major:=m["major"]
        ,minor:=m["minor"]
        ,patch:=m["patch"]
        ,prerelease:=m["prerelease"]
        ,buildmetadata:=m["buildmetadata"]
    }
}