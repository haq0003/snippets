```
                    $googleService = $this->getClient();
                    $drive = new Google_Service_Drive($googleService);
                    $pageToken = null;
                    $listImages = [];

                    do {
                        $response = $drive->files->listFiles(array(
                            'q' => "trashed = false AND '1rvgYUn6XXXXXXXXXXXUsOLiNB6aZo' IN parents ",
                            'spaces' => 'drive',
                            'pageToken' => $pageToken,
                            'fields' => 'nextPageToken, files(id, name)',
                        ));

                        foreach ($response->files as $file) {
                            $this->output->writeln("Fichier : {$file->name} ({$file->id})");
                            $listImages[] = $file;

                        }
                        $pageToken = $response->getNextPageToken();
                    } while ($pageToken != null);
```
