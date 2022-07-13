Setting things up
===

First off, you'll need something to run an instance of linux. This can be a remote server like UCLA's _Hoffman2_
or just a subsystem or vitural machine on your desktop. It can be difficult to navigate but the following programs are
very helpful:

- For remote servers: MobaXterm is a nice way of connecting and interacting with the shell.
- For windows users: WinSCP provides a GUI to interact with the file directory you'll need.
- For everyone: VS Code is nice to make modifications to filepaths in the COMPASS code if you need to do so.

The First Run
---
The samples processed by COMPASS come from the _SRA Toolkit_, so you will need to install the latest version on
your linux machine. To download, get the lastest applicable release [here](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software).
Make sure you dowload the right version (Hoffman2 uses CentOS).

To install the file, run `tar xzvf your_file_name.tar.gz`. Follow the setup provided in [SRA's github](https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit).
Run all of the checks to ensure it was installed correctly. This is essential and saves a lot of headache later.

Now it's time to download some data. Running the following command will fetch it from SRA's archives: `/path/to/SRA/toolkit/fasterq-dumpSRR# -O /path/to/output -t /path/for/temp/files -p`.
This looks intimidating but it's just a matter of filling in the blanks. For example, I would input the following on my system:

`$PWD/SRA`
