$1 == "BSS" {
    MAC = $2
    wifi[MAC]["enc"] = "Open"
}
$1 == "SSID:" {
    wifi[MAC]["SSID"] = $2
}
$1 == "freq:" {
    wifi[MAC]["freq"] = $NF
}
$1 == "signal:" {
    wifi[MAC]["sig"] = $2 " " $3
}
$1 == "WPA:" {
    wifi[MAC]["enc"] = "WPA"
}
$1 == "WEP:" {
    wifi[MAC]["enc"] = "WEP"
}
END {
    printf "%s\t\t%s\t%s\t\t%s\n","SSID","Frequency","Signal","Encryption"

    for (w in wifi) {
        printf "%s\t\t%s\t\t%s\t%s\n",wifi[w]["SSID"],wifi[w]["freq"],wifi[w]["sig"],wifi[w]["enc"]
    }
}
