#
# 'DBStat' 모듈의 모듈 매니페스트
#
# 생성자: leedox
#
# 생성 날짜: 2023-11-05
#

@{

    # 이 매니페스트와 연결된 스크립트 모듈 또는 이진 모듈 파일입니다.
    RootModule        = 'DBStat.psm1'

    # 이 모듈의 버전 번호입니다.
    ModuleVersion     = '0.0.1'

    # 지원되는 PSEditions
    # CompatiblePSEditions = @()

    # 이 모듈을 고유하게 식별하는 데 사용되는 ID
    GUID              = '5c8e8fa3-f415-4b8f-b6c2-9c5c05481c41'

    # 이 모듈의 작성자
    Author            = 'leedox'

    # 이 모듈의 제조업체 또는 공급업체
    CompanyName       = '알 수 없음'

    # 이 모듈의 저작권 정보
    Copyright         = '(c) 2023 leedox. All rights reserved.'

    # 이 모듈에서 제공하는 기능에 대한 설명
    # Description = ''

    # 이 모듈에 필요한 Windows PowerShell 엔진의 최소 버전
    # PowerShellVersion = ''

    # 이 모듈에 필요한 Windows PowerShell 호스트 이름
    # PowerShellHostName = ''

    # 이 모듈에 필요한 Windows PowerShell 호스트의 최소 버전
    # PowerShellHostVersion = ''

    # 이 모듈에 필요한 Microsoft .NET Framework의 최소 버전입니다. 이 필수 조건은 PowerShell 데스크톱 버전에만 유효합니다.
    # DotNetFrameworkVersion = ''

    # 이 모듈에 필요한 CLR(공용 언어 런타임)의 최소 버전입니다. 이 필수 조건은 PowerShell 데스크톱 버전에만 유효합니다.
    # CLRVersion = ''

    # 이 모듈에 필요한 프로세서 아키텍처(None, X86, Amd64)
    # ProcessorArchitecture = ''

    # 이 모듈보다 먼저 글로벌 환경으로 가져와야 하는 모듈
    # RequiredModules = @()

    # 이 모듈을 가져오기 전에 로드해야 하는 어셈블리
    # RequiredAssemblies = @()

    # 이 모듈을 가져오기 전에 호출자의 환경에서 실행되는 스크립트 파일(.ps1)입니다.
    # ScriptsToProcess = @()

    # 이 모듈을 가져올 때 로드되는 유형 파일(.ps1xml)
    # TypesToProcess = @()

    # 이 모듈을 가져올 때 로드되는 형식 파일(.ps1xml)
    # FormatsToProcess = @()

    # RootModule/ModuleToProcess에 지정된 모듈의 중첩 모듈로 가져올 모듈
    # NestedModules = @()

    # 이 모듈에서 내보낼 함수입니다. 최상의 성능을 얻으려면 와일드카드를 사용하지 말고, 항목을 삭제하지도 마세요. 내보낼 함수가 없으면 빈 배열을 사용하세요.
    FunctionsToExport = @(
        'Find-Key',
        'Get-Table',
        'Get-TableUsage',
        'Get-TableUsageHome'
        'Get-Column',
        'Get-ColumnUsage',
        'Get-ColumnAlter',
        'Set-Column',
        'Invoke-ColumnUsage',
        'Invoke-ColumnAlter'
    )

    # 이 모듈에서 내보낼 cmdlet입니다. 최상의 성능을 얻으려면 와일드카드를 사용하지 말고, 항목을 삭제하지도 마세요. 내보낼 cmdlet이 없으면 빈 배열을 사용하세요.
    CmdletsToExport   = @()

    # 이 모듈에서 내보내는 변수
    VariablesToExport = '*'

    # 이 모듈에서 내보낼 별칭입니다. 최상의 성능을 얻으려면 와일드카드를 사용하지 말고, 항목을 삭제하지도 마세요. 내보낼 별칭이 없으면 빈 배열을 사용하세요.
    AliasesToExport   = @()

    # 이 모듈에서 내보내기 위한 DSC 리소스
    # DscResourcesToExport = @()

    # 이 모듈과 함께 패키지된 모든 모듈 목록입니다.
    # ModuleList = @()

    # 이 모듈과 함께 패키지된 모든 파일 목록
    # FileList = @()

    # RootModule/ModuleToProcess에 지정된 모듈로 전달할 개인 데이터입니다. 이 데이터에는 PowerShell에서 사용하는 추가 모듈 메타데이터가 있는 PSData 해시 테이블도 포함될 수 있습니다.
    PrivateData       = @{

        PSData = @{

            # 이 모듈에 적용된 태그입니다. 이러한 태그는 온라인 갤러리에서 모듈을 검색하는 데 도움이 됩니다.
            # Tags = @()

            # 이 모듈에 대한 라이선스 URL입니다.
            # LicenseUri = ''

            # 이 프로젝트에 대한 기본 웹 사이트의 URL입니다.
            # ProjectUri = ''

            # 이 모듈을 나타내는 아이콘의 URL입니다.
            # IconUri = ''

            # 이 모듈의 ReleaseNotes
            # ReleaseNotes = ''

        } # PSData 해시 테이블의 끝

    } # PrivateData 해시 테이블의 끝

    # 이 모듈의 HelpInfo URI
    # HelpInfoURI = ''

    # 이 모듈에서 내보낸 명령의 기본 접두사입니다. Import-Module -Prefix를 사용하여 기본 접두사를 재정의하십시오.
    # DefaultCommandPrefix = ''

}

