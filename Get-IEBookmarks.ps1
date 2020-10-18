function Get-IEBookmarks {
	BEGIN {
		$path = [Environment]::GetFolderPath('Favorites')
		Write-Output "[+] Bookmarks location: $($path)"
	}
	
	PROCESS {
    		Get-ChildItem -Recurse $path -Include "*.url" | ForEach {
				$data = Get-Content $_.fullname | Select-String -Pattern URL
				Write-Output $data
			}
	}
	
	END {
		Write-Output "[+] Process completed..."
	}
}
