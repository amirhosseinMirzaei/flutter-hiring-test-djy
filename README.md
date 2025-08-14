<div dir="rtl">

<h1>Flutter Countries App</h1>

<p>
 نمایش لیست کشورها با <strong>معماری Clean Architecture</strong> و استفاده از <strong>BLoC</strong> و <strong>Freezed</strong>.<br>
این پروژه شامل نمایش لیست کشورها، کش کردن تصاویر، مدیریت حالات لودینگ و ارورها و همچنین تست واحد بخش‌های کلیدی است.
</p>

<hr>

<h2>ویژگی‌ها</h2>
<ul>
    <li><strong>Immutable Models با Freezed</strong>: ایجاد مدل‌های داده‌ای ایمن، Immutable و قابل Serialize با پشتیبانی از JSON.</li>
    <li><strong>Clean Architecture</strong>: لایه‌بندی پروژه به صورت <code>presentation</code>، <code>features</code> و <code>data</code> برای جداسازی منطق و سهولت توسعه.</li>
    <li><strong>Dependency Injection</strong>: تزریق <code>Repository</code> و <code>Data Source</code> به BLoC برای انعطاف‌پذیری و قابلیت تست بهتر.</li>
    <li><strong>State Management با BLoC</strong>: مدیریت حالات <em>لودینگ</em>، <em>خطا</em> و <em>نمایش داده‌ها</em>.</li>
    <li><strong>بهینه‌سازی رندر با RepaintBoundary</strong>: استفاده از ویجت برای جلوگیری از رندر مجدد کل صفحه و کاهش فشار روی GPU/CPU، مخصوصاً در بخش‌هایی که شامل تصاویر کش‌شده یا لیست‌های طولانی هستند.</li>
    <li><strong>دریافت داده‌ها با Dio</strong>: ارتباط با API یا فایل JSON آنلاین با استفاده از کتابخانه‌ی <code>dio</code>.</li>
    <li><strong>کش کردن تصاویر</strong>: استفاده از <code>cached_network_image</code> برای ذخیره و نمایش بهینه تصاویر.</li>
    <li><strong>Shimmer Effect</strong>: ایجاد افکت Skeleton Loading قبل از لود شدن محتوای اصلی.</li>
    <li><strong>Unit Test و Mocking</strong>: تست لایه‌ی داده‌ها با <code>mockito</code>.</li>
</ul>

<hr>

<h2>نصب و راه‌اندازی</h2>


<h3>3. تولید کلاس‌های Freezed</h3>
<p>برای ساخت کلاس‌های داده‌ای امن و قابل Serialize:</p>
<pre><code>dart run build_runner build --delete-conflicting-outputs
</code></pre>

<h3>4. اجرای پروژه</h3>
<pre><code>flutter run
</code></pre>

<hr>

<h2>تست پروژه</h2>

<h3>اجرای تست‌ها</h3>
<pre><code>flutter test test/country/data/country_remote_data_source_test.dart
</code></pre>

<h3>نکات تست</h3>
<ul>
  <li>تست‌ها شامل <strong>Unit Test</strong> برای لایه‌ی داده‌ها هستند.</li>
  <li>از <code>mockito</code> برای شبیه‌سازی API استفاده شده است.</li>
</ul>

<hr>

<h2>ساختار پوشه‌ها</h2>
<pre><code>lib/
 ├── features/         
 │    ├── countries/    
 │    │     ├── data/    # Repository و Data Source, model
 │    │     ├── domain/  #  UseCase 
 │    │     └── presentation/ # ویجت‌ها و BLoC
 └── main.dart          
</code></pre>

</div>
