#!/bin/bash

sed -i '/\['${version}'\]/a ''\\n### Required Versions\n\n### Release Notes\n' ${changelog}
sed -i '/### Required Versions/a ''\\n\| Service \| Version(s) \| Latest \|\n\|\:--\|\:--\|--\:\|\n\n' ${changelog}
versionArray=($(jq -r '.apiVersions | keys | .[]' package.json))
arrayLength=$(jq '.apiVersions | length' package.json)
for ((i=0; i<"${arrayLength}"; i++)); do
  key=${versionArray[i]}
  normalized=$(echo $key | sed -r 's/([A-Z])/-\L\1/g;s/^-//')
  if [[ "${normalized}" == "sts-leaderboard" ]]; then
    normalized="leaderboard-service"
  elif [[ "${normalized}" == "sts-badge" ]]; then
    normalized="badge-service"
  fi
  releases="https://github.com/${githubUser}/${normalized}/releases"
  val=$(jq -r --arg KEY "${key}" '.apiVersions."\($KEY)"' package.json)
  versions=($(echo $val | grep -oE "(\^?)([0-9]+)\.([0-9]+)\.([0-9]+)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+[0-9A-Za-z-]+)?"))

  if [[ ${#versions[@]} -eq 1 ]]; then
    case $(echo "${val}" | grep -Fq "^" >/dev/null; echo $?) in
      0)  orNewer="\^";;
      1)  orNewer="";;
      *)  echo "ERROR";;
    esac
    linkVersion="${val//[^0-9.]/}"
    sed -i '/|:--|:--|--:|/a ''\| **['${normalized}'\]\['${normalized}'\]\** \| \['"${orNewer}""${linkVersion}"'\]\['${normalized}'-version\] \| \[latest release\]\['${normalized}'-latest\] \|' ${changelog}
    echo "" >> ${changelog}
    sed -i '$a['${normalized}'-version]: '${releases}'/tag/v'"${linkVersion}"'' ${changelog}
  elif [[ ${#versions[@]} -gt 1 ]]; then
    versionString=""
    for ((j=0; j<"${#versions[@]}"; j++)); do
      case $(echo "${versions[j]}" | grep -Fq "^" >/dev/null; echo $?) in
        0)  orNewer="\^";;
        1)  orNewer="";;
        *)  echo "ERROR";;
      esac
      ver=${versions[j]//[^A-Za-z0-9.]}
      temp="[${orNewer}${ver}][${normalized}-${ver}-version]"
      versionString="${temp}, ${versionString}"
      echo "" >> ${changelog}
      sed -i '$a['${normalized}'-'${ver}'-version]: https://github.com/'${githubUser}'/'${normalized}'/releases/tag/v'"${ver}"'' ${changelog}
    done
    modified=${versionString%??}
    sed -i '/|:--|:--|--:|/a ''\| **['${normalized}'\]\['${normalized}'\]\** \| '"${modified}"' \| \[latest release\]\['${normalized}'-latest\] \|' ${changelog}
    sed -i '/- \*\*\['${normalized}'\]\['${normalized}'\]\*\*:/a''\ \ - \[latest release\]\['${normalized}'-latest\]' ${changelog}
  else
    echo "ERROR!"
  fi
  echo "" >> ${changelog}
  sed -i '$a['${normalized}']: '${releases} ${changelog}
  sed -i '$a['${normalized}'-latest]: '${releases}'/latest' ${changelog}
done
