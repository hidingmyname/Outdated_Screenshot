# Detecting Outdated Screenshot from GUI Document

## Project summary

In this paper, we propose an approach called DOSUD, *i.e.*, <u>D</u>etecting <u>O</u>utdated <u>S</u>creenshots in G<u>U</u>I <u>D</u>ocument. DOSUD is the first approach that is able to identify whether a screenshot is outdated or not in application documents. To handle the challenge of enumerating screenshots, given an app, DOSUD installs its brand new version and outdated versions on a local device, and uses a GUI testing technique to enumerate their screenshots. To handle the challenge of understanding subtle differences, we train a classifier based on our collected screenshots. After its classifier is trained, given a screenshot of a document, DOSUD can predict whether it is outdated or not.

## Repository

The folder `code`: the source code, including our *App Screenshot Extractor*, *Document Screenshot Extractor*, *Screenshot Classifier*, program for drawing figures and other components.

The folder `dataset`: the dataset of all captured screenshots used in our **EVALUATION ON BENCHMARK**.

The folder `real_bugs`: details of 20 detected real bugs on 20 Android Apps and 17 detected real bugs on Visual Studio Code (**EVALUATION IN THE WILD**).

- `Android_Apps`: each folder represent an application.

- `VSCode`: In the `VSCode` directory, each folder represents a distinct test case. Additionally, all outdated screenshots are reported to the issue tracker of Visual Studio Code. For more detailed information, please refer to the corresponding `json` file. An example is provided below:

	```json
	{
	    "src": "https://github.com/microsoft/vscode-docs/blob/main/docs/editor/images/accessibility/high-contrast.png",
	    "issue": "https://github.com/microsoft/vscode-docs/issues/6883",
	    "status": "fixed",
	    "pr": "https://github.com/microsoft/vscode-docs/pull/6893"
	}
	```

	The fields in the `json` file are defined as follows:

	- `src`: This field contains the URL of the screenshot source.
	- `issue`: This field contains the URL of the reported issue.
	- `status`: This field indicates the status of the reported issue. A status of `fixed` signifies that the issue has been resolved, while `open` indicates that the issue has been confirmed by the developers and is pending resolution.
	- `pr`: This field contains the URL of the pull request that resolves the reported issue.

