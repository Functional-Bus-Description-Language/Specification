.bp
.ps 16
\f[B]Glossary\f[]
.ps

.LP
Not all terms defined in the glossary list are used in the specification.
Some of them are formally defined because they are helpful when discussing, for example, compiler implementation.

.IP "\fBcall register\fR" 0.2i
The call register term is used to refer to the \fCproc\fR register with the associated call pulse signal.
When the call register is written, the call pulse is generated.
.IP \fBdata\fR
The data term is used to refer to the content of the registers.
Unless it is used in the context of internal data types of the language.
.IP \fBdownstream\fR 
The downstream is a stream from the requester to the provider.
.IP "\fBexit register\fR" 0.2i
The exit register term is used to refer to the \fCproc\fR register with the associated exit pulse signal.
When the exit register is read, the exit pulse is generated.
.IP \fBfunctionality\fR
The functionality is the functionality of given data.
It can be seen as a type of the data.
In case of functionalities encapsulating other functionalities, such as \fCbus\fR, \fCblock\fR, \fCproc\fR or \fCstream\fR, the functionality is used to denote a broader context of encapsulated data.
.IP \fBgap\fR
The gap term is used to refer to unused bits within register.
.IP \fBgateware\fR
The gateware term is used to refer to the overall configuration of the logic placed in the FPGA to make it behave according to the desired description.
The term is not formally defined anywhere, however it is used to unburden the firmware term.
IEEE Std 610.12-1990 also mentions that the firmware term is too overloaded and confusing.
.IP \fBgenerator\fR
The generator term is used to refer to the part of a compiler directly responsible for the target code generation based on registerification results.
.IP \fBinformation\fR
The information term is used to refer to the metadata on the functionality data.
The metadata describes where the data is located, for example bit masks and register addresses, and how to access the data.
.IP \fBmeans\fR
The means term is used to refer to the automatically generated method or data that shall be used by the requester to request particular functionality.
A means in particular programming language is usually a function, method or procedure that shall be called or class, dictionary, map or structure containing information on how to access particular functionality.
.IP \fBprovider\fR
The provider is the system component containing the generated registers and providing described functionalities.
.IP "\fBpure call register\fR"
The term pure call register is used to refer to the call register containing no \fCproc\fR returns.
.IP "\fBpure exit register\fR"
The term pure exit register is used to refer to the exit register containing no \fCproc\fR params.
.IP \fBregisterification\fR
The registerification is the process of placing data of functionalities into the registers.
The process includes assigning data bit masks, register addresses as well as block addresses and masks.
The term is new in the field and is coined in the specification.
.IP \fBrequester\fR
The requester is the system component accessing the generated registers and requesting described functionalities.
.IP "\fBstrobe register\fR"
The strobe register term is used to refer to the \fCstream\fR register with the associated strobe pulse signal.
When the strobe register is written (downstream), or read (upstream) the strobe pulse is generated.
.IP \fBtarget\fR 
The target term is used to refer to the transpilation target.
For example, a target can be a requester Python code allowing to access functionalities of the provider in an asynchronous fashion.
A VHDL code providing description of the functionality registers and exposing AXI compliant interface is a valid provider target.
A JSON file describing registerification results is for example a valid documentation target.
The target depends on several factors, but the most important ones are programming/description language, synchronous or asynchronous access interface, bus type, dynamic or static address map reloading.
Each target has its recipient.
It is either provider, requester or documentation.
.IP \fBupstream\fR 
The upstream is a stream from the provider to the requester.
