









         



 

   
<a href="https://flutter.dev" rel="nofollow"><img height="39" src="https://camo.githubusercontent.com/a695c7e66641a71d7d3825b233f91cce2fbc78193df339a44230508228c567fd/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f312f31372f476f6f676c652d666c75747465722d6c6f676f2e706e67" alt="Flutter Logo" data-canonical-src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" style="max-width: 100%;"></a>    
</p>
<h1 dir="auto"><a id="user-content-flutter-ecommerce-app" class="anchor" aria-hidden="true" href="#flutter-ecommerce-app"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Flutter Ecommerce App</h1>
<h2 dir="auto"><a id="user-content-file-structure" class="anchor" aria-hidden="true" href="#file-structure"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>File Structure</h2>
<div class="highlight highlight-source-shell notranslate position-relative overflow-auto" dir="auto" data-snippet-clipboard-copy-content=".
├── android # android files
├── assets # assets 
│   ├── images | fonts | locales | lottie | icons
├── ios # android files
└── lib
    ├── modules
    │   ├── auth
    │   ├── cart
    │   ├── product
    │   ├── order
    │   ├── login
    │   └── Profile
    ├── utils | theme | localization | generated | addon | data | contants | utils"><pre><span class="pl-c1">.</span>
├── android <span class="pl-c"><span class="pl-c">#</span> android files</span>
├── assets <span class="pl-c"><span class="pl-c">#</span> assets </span>
│   ├── images <span class="pl-k">|</span> fonts <span class="pl-k">|</span> locales <span class="pl-k">|</span> lottie <span class="pl-k">|</span> icons
├── ios <span class="pl-c"><span class="pl-c">#</span> android files</span>
└── lib
    ├── modules
    │   ├── auth
    │   ├── cart
    │   ├── product
    │   ├── order
    │   ├── login
    │   └── Profile
    ├── utils <span class="pl-k">|</span> theme <span class="pl-k">|</span> localization <span class="pl-k">|</span> generated <span class="pl-k">|</span> addon <span class="pl-k">|</span> data <span class="pl-k">|</span> contants <span class="pl-k">|</span> utils</pre></div>
<h2 dir="auto"><a id="user-content-ui" class="anchor" aria-hidden="true" href="#ui"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Ui</h2>
<p dir="auto">
  <a target="_blank" rel="noopener noreferrer nofollow" href="https://user-images.githubusercontent.com/90983768/200275228-d34fe645-a461-4f85-a4e0-5b741d70a4d0.png"><img src="https://user-images.githubusercontent.com/90983768/200275228-d34fe645-a461-4f85-a4e0-5b741d70a4d0.png" alt="home" height="500" style="max-width: 100%;"></a>   
  <a target="_blank" rel="noopener noreferrer nofollow" href="https://user-images.githubusercontent.com/90983768/200275260-1dbdd64b-21b6-494f-a200-81a5cffb55cf.png"><img src="https://user-images.githubusercontent.com/90983768/200275260-1dbdd64b-21b6-494f-a200-81a5cffb55cf.png" alt="orders" height="500" style="max-width: 100%;"></a>   
  <a target="_blank" rel="noopener noreferrer nofollow" href="https://user-images.githubusercontent.com/90983768/200275304-96c45b5a-1316-4475-852c-9ae7516a43e0.png"><img src="https://user-images.githubusercontent.com/90983768/200275304-96c45b5a-1316-4475-852c-9ae7516a43e0.png" alt="cart" height="500" style="max-width: 100%;"></a>  
  <a target="_blank" rel="noopener noreferrer nofollow" href="https://user-images.githubusercontent.com/90983768/200275322-f7ea42a0-47a0-459b-a684-aaf78f8be26a.png"><img src="https://user-images.githubusercontent.com/90983768/200275322-f7ea42a0-47a0-459b-a684-aaf78f8be26a.png" alt="profile" height="500" style="max-width: 100%;"></a> 
   <a target="_blank" rel="noopener noreferrer nofollow" href="https://user-images.githubusercontent.com/90983768/200275334-e186dea7-608f-424d-a150-1d550539635a.png"><img src="https://user-images.githubusercontent.com/90983768/200275334-e186dea7-608f-424d-a150-1d550539635a.png" alt="profile1" height="500" style="max-width: 100%;"></a> 
  <a target="_blank" rel="noopener noreferrer nofollow" href="https://user-images.githubusercontent.com/90983768/200275346-33a492a2-af6d-416a-9d8c-4ca57abf71d5.png"><img src="https://user-images.githubusercontent.com/90983768/200275346-33a492a2-af6d-416a-9d8c-4ca57abf71d5.png" alt="drawer" height="500" style="max-width: 100%;"></a> 
  <a target="_blank" rel="noopener noreferrer nofollow" href="https://user-images.githubusercontent.com/90983768/200275370-206476dd-bd4e-4d93-93f5-e465d2822174.png"><img src="https://user-images.githubusercontent.com/90983768/200275370-206476dd-bd4e-4d93-93f5-e465d2822174.png" alt="settings" height="500" style="max-width: 100%;"></a> 
</p>
