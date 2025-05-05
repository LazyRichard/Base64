Describe 'Base64' {
    Context 'Function: Test-Base64' {
        It "Test-Base64 -Base64String 'VGhpc0lzQU5pY2VTdHJpbmc=' -> true" {
            Test-Base64 -Base64String 'VGhpc0lzQU5pY2VTdHJpbmc=' | Should -Be $true
        }
        It "'SGVsbG8gV29ybGQ=' | Test-Base64 -> true" {
            'SGVsbG8gV29ybGQ=' | Test-Base64 | Should -Be $true
        }
    }
    Context 'Function: ConvertTo-Base64' {
        It "ConvertTo-Base64 -String 'ThisIsANiceString' -> VGhpc0lzQU5pY2VTdHJpbmc=" {
            ConvertTo-Base64 -String 'ThisIsANiceString' | Should -Be 'VGhpc0lzQU5pY2VTdHJpbmc='
        }

        It "'Hello World' | ConvertTo-Base64 -> SGVsbG8gV29ybGQ=" {
            'Hello World' | ConvertTo-Base64 | Should -Be 'SGVsbG8gV29ybGQ='
        }

        It "@('123', '456') | ConvertTo-Base64 -> MTIzDQo0NTY=" -Skip:(!$IsWindows) {
            @('123', '456') | ConvertTo-Base64 | Should -Be 'MTIzDQo0NTY='
        }

        It "@('123', '456') | ConvertTo-Base64 -> MTIzCjQ1Ng==" -Skip:(!$IsLinux) {
            @('123', '456') | ConvertTo-Base64 | Should -Be 'MTIzCjQ1Ng=='
        }

        It "Get-Content tests/sample.txt | ConvertTo-Base64 -> Get-Content tests/sample-encoded-windows.txt" -Skip:(!$IsWindows) {
            Get-Content tests/sample.txt | ConvertTo-Base64 | Should -Be $(Get-Content tests/sample-encoded-windows.txt)
        }

        It "Get-Content tests/sample.txt | ConvertTo-Base64 -> Get-Content tests/sample-encoded-linux.txt" -Skip:(!$IsLinux) {
            Get-Content tests/sample.txt | ConvertTo-Base64 | Should -Be $(Get-Content tests/sample-encoded-linux.txt)
        }
    }
    Context 'Function: ConvertFrom-Base64' {
        It "ConvertFrom-Base64 -Base64String 'VGhpc0lzQU5pY2VTdHJpbmc=' -> ThisIsANiceString" {
            ConvertFrom-Base64 -Base64String 'VGhpc0lzQU5pY2VTdHJpbmc=' | Should -Be 'ThisIsANiceString'
        }

        It "'SGVsbG8gV29ybGQ=' | ConvertFrom-Base64 -> Hello World" {
            'SGVsbG8gV29ybGQ=' | ConvertFrom-Base64 | Should -Be 'Hello World'
        }
    }
}
