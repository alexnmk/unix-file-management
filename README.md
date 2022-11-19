# unix-file-management

The scripts are built to arrange a very large collection of files with random, unhelpful file names.
<br/><br/>
<h3>Menu</h3>
<ul>
  <li><a href="#dirRestructure">Directory Restructure</a></li>
  <li><a href="#dataVerification">Data Verification</a></li>
  <li><a href="#dataCorrection">Data Correction</a></li>
  <li><a href="#dataAggregationByYear">Data Aggregation by Year</a></li>
  <li><a href="#createIndexFile">Create Index File</a></li>
  <li><a href="#getDataByTown">Get Data by Town</a></li>
  <li><a href="#dataAggregationByTown">Data Aggregation by Town</a></li>
</ul>
<br/><br/>
<a id="dirRestructure"></a>

[Directory Restructure](dirRestructure.sh)
<br/>Files on a flat data tree structure are arranged into a new tree structure with depths based on an item of data within each file.
<br/>This script arranges files based on their year data.
<br/>Original tree structure example:
<br/><img width="465" alt="image" src="https://user-images.githubusercontent.com/73376820/202840849-bc2afd95-5ca2-41de-be6c-1c57700a2d61.png">
<br/>Restructured data tree example:
<br/><img width="465" alt="image" src="https://user-images.githubusercontent.com/73376820/202840939-26137bf3-d67f-457e-8510-a35c31b2d873.png">

<a id="dataVerification"></a>
[Data Verification](dataVeification.sh)
<br/>This script is to check whether each file has been correctly placed.
<br/>There are files with damaged date entries. This script displays a list of filenames with non-matching data stamps.
<br/>Output example:
<br/><img width="465" alt="image" src="https://user-images.githubusercontent.com/73376820/202841215-83662dc9-b722-42b3-bd39-918ad69017e9.png">

<a id="dataCorrection"></a>
[Data Correction](dataCorrection.sh)
<br/>This script is to fix these corrupted data in files.
<br/>This script changes corrupted date (i.e. xxxx/01/16) to date matches with the directory (i.e. 2014/01/16)
<br/>No output. Need to check data by running [Data Verification](dataVerification.sh).

<a id="dataAggregationByYear"></a>
[Data Aggregation by Year](dataAggregationByYear.sh)
<br/>This script is to aggregate data by year.
<br/>The script accepts a year number followed by a keyword that shows the information to be displayed (i.e. *minimum*, *maximum*, *average*, *all*).
<br/>The year number should correspond to one of those available in the tree.
<br/>*Average* output example:
<br/><img width="444" alt="image" src="https://user-images.githubusercontent.com/73376820/202841717-c6d58aa1-eb1b-40aa-b80f-ad4bf9cd75af.png">
<br/>*Maximum* output example:
<br/><img width="444" alt="image" src="https://user-images.githubusercontent.com/73376820/202841733-6d08c4ad-ac52-4076-b89d-a64a52df66b2.png">
<br/>*Minimum* output example:
<br/><img width="444" alt="image" src="https://user-images.githubusercontent.com/73376820/202841753-e8c338ca-ad0a-4466-9d24-aead1d806514.png">
<br/>*All* output example:
<br/><img width="444" alt="image" src="https://user-images.githubusercontent.com/73376820/202841760-1417c5ac-2ea1-446f-8431-8f610c262758.png">

<a id="createIndexFile"></a>
[Create Index File](createIndexFile.sh)
<br/>Index files can be considered as a more efficient way of searching through large numbers of files for predetermined data.
<br/>This script creates a file containing a lists of towns and files that are associated with the town.
<br/>Index file example:
<br/><img width="452" alt="image" src="https://user-images.githubusercontent.com/73376820/202842226-3e42a3fd-394a-4bb0-986e-7bed1099ad0b.png">

<a id="getDataByTown"></a>
[Get Data by Town](getDataByTown.sh)
<br/>This script is to report yearly population data by town using index file.
<br/>Output example:
<br/><img width="455" alt="image" src="https://user-images.githubusercontent.com/73376820/202842389-55fa4675-e4b9-4fad-b88c-74fcc6c249b8.png">

<a id="dataAggregationByTown"></a>
[Data Aggregation by Town](dataAggregationByTown.sh)
<br/>This script is to report the *average*, *maximum*, *minimum* and *all* population in a town aggregated for all years.
<br/>This script create a file index if the file does not exist.
<br/>Output example:
<br/><img width="459" alt="image" src="https://user-images.githubusercontent.com/73376820/202842686-945065e9-a9ed-419d-8e06-3078ad285e56.png">

