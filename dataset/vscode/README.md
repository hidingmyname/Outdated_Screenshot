# How to capture Visual Studio Code screenshots

1. **Retrieving the Visual Studio Code Repository**

	To begin, download the Visual Studio Code repository using the following command:

	```bash
	git clone https://github.com/microsoft/vscode-test.git
	```

	To access older versions of Visual Studio Code, you can do so by checking out the corresponding git branch version. Use the following commands:

	```bash
	git fetch
	git checkout release/1.70
	```

2. **Executing the Test Suite**

	Next, navigate to the testing directory and execute the test suite. Use the following commands to enter the appropriate directories:

	```bash
	cd test/smoke
	cd test/integration
	```

	Visual Studio Code offers three types of test suites: unit, integration, and smoke. For this procedure, we will focus on the integration and smoke test suites as they involve user interface testing. For detailed instructions, please refer to the official tutorials for the integration test and the smoke test. For detailed instructions, please refer to the official tutorials for the `integration` test  ([README](https://github.com/microsoft/vscode/blob/main/test/integration/browser/README.md)) and the `smoke` test ([README](https://github.com/microsoft/vscode/blob/main/test/unit/README.md)).

3. **Capturing the User Interface During Testing**

	Lastly, utilize Open Broadcaster Software (OBS) to capture the user interface during testing. Follow the official OBS tutorial for guidance.

	[OBS]: https://obsproject.com/

	After recording the testing process, you can extract screenshots from the video at a rate of one frame per second (typically 60 frames per second). This will provide a comprehensive visual record of the Visual Studio Code testing process.

