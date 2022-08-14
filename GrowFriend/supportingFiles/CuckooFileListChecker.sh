#!/bin/bash

whotest[0]='test' || (echo 'Failure: arrays not supported in this version of bash.' && exit 2)

# Please don't forget to sort by filename
testableFiles=(
    "ContactDetailsPresenterImpl.swift"
    "ContactRepository.swift"
    "ContactServiceApi.swift"
    "ContactsListDelegate.swift"
    "ContactsListPresenterImpl.swift"
    "ErrorProtocol.swift"
    "GetContactsUseCase.swift"
    "GetLastContactsListUseCase.swift"
    "LastStateRepository.swift"
    "NetworkMoyaProviders.swift"
    "SetLastContactsListUseCase.swift"
    "Sessions.swift"
)

for file in ${testableFiles[@]}; do
    filePath= find $(pwd) -type f -path "*/GrowFriend/*" -name $file
    paths="${paths} ${filePath}"
    if [ -z "$paths" ];
    then
        >&2 echo "$file not found. Remove it or check the case"
        exit 3
    fi
done
echo $paths
