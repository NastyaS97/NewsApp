NewsAPP with Swift

The goal is to create a News Feed app which gives a user regularly-updated news from the internet related to a particular topic, person, or location. The presentation of the information as well as the topic is up to you. This app is powered by NewsAPI.

Components Used

UITableView
UISearchBar
SFSafariView
UIPageViewController
UITabBar
UIImage with IBInspectable
UINavBar
UICollection

This app uses NewsAPI to get various sources and each source can provide major headlines. It uses Retrofit 2 to fetch news sources and news headlines from the API and displays in a RecyclerView. It uses Room Persistence Library to provide offline functionality App first loads the data from DB and then checks for fresh data from API, API is only called if DB data is empty or expired The main aim of this sample app is show how to use the new Architecture Guidelines with Kotlin.

Project Specifications

1. Main Screen. App contains a main screen which displays multiple news stories. 

2. News Screen. App contains a information screen for one news.
This screen shows the title of the news and the news text, as well as additional information about the date of publication and the author.

3.Weather Screen. The app displays the current weather.

Functionnality

1. Main Screen Updates. Stories shown on the main screen update properly whenever new news data is fetched from the API.
2. Errors. The code runs without errors.
3. You can scroll through the news. Also, update them. To do this, you need to swipe down on the screen. You can also searched for news through SearchBar. To go to news, you need to touch the desired cell.
4. Go to Safari. Clicking on a "Go to safari" uses an intent to open the story in the user’s browser.
5. API Query. App queries the newsapi.org api to fetch news stories related to the topic chosen by the user, using either the ‘test’ api key or the user’s key.
JSON Parsing. The JSON response is parsed correctly, and relevant information is stored in the app.
6. Use of Loaders. Networking operations are done using a Loader rather than an AsyncTask.
7. NavBar. The item on the NavBar has been added to return to all news. Also, to view news in a random sequence, select the Scroll News button on the NavBar. After navigating to a news item, swipe right to move to the next news item. This feature is runned by PageView. 

If you want to run:

Go to NewsAPI(for examle https://newsapi.org) and generate an API key (It's only 2 steps!)
Copy the API key after generation and paste into "func loadNews"
For a test run, this step must be skipped, because the app is an add-on with my key.
Run the app

Architecture

The app uses ViewModel to abstract the data from UI and Repository as single source of truth for data. Repository fetch the data from database and shows, while also checks if the data is old. If the data is old or database does not contain any data (such as first launch) it fetches data from Web Service and saves the data into database.

Screenshots
![Simulator Screen Shot - iPhone 11 - 2021-04-21 at 18 16 52](https://user-images.githubusercontent.com/67908432/115585860-acc09200-a2d4-11eb-929b-41d98b78b6ba.png)
![Simulator Screen Shot - iPhone 11 - 2021-04-21 at 18 16 10](https://user-images.githubusercontent.com/67908432/115585869-af22ec00-a2d4-11eb-9e9a-6de2cac9fac3.png)
![Simulator Screen Shot - iPhone 11 - 2021-04-21 at 18 16 14](https://user-images.githubusercontent.com/67908432/115585894-b34f0980-a2d4-11eb-87fa-dddf0474f0dc.png)
![Simulator Screen Shot - iPhone 11 - 2021-04-21 at 18 16 22](https://user-images.githubusercontent.com/67908432/115585919-b9dd8100-a2d4-11eb-8e4a-bb1cc288ef45.png)
![Simulator Screen Shot - iPhone 11 - 2021-04-21 at 18 24 23](https://user-images.githubusercontent.com/67908432/115585921-ba761780-a2d4-11eb-8aad-106f146d63c8.png)
![Simulator Screen Shot - iPhone 11 - 2021-04-21 at 18 24 57](https://user-images.githubusercontent.com/67908432/115585927-bc3fdb00-a2d4-11eb-8caf-11b11f3d8872.png)
![Simulator Screen Shot - iPhone 11 - 2021-04-21 at 18 25 01](https://user-images.githubusercontent.com/67908432/115585942-c06bf880-a2d4-11eb-99f5-94fd9adde69b.png)
![Simulator Screen Shot - iPhone 11 - 2021-04-21 at 18 25 04](https://user-images.githubusercontent.com/67908432/115585949-c235bc00-a2d4-11eb-912a-1e3f05b38b3b.png)


Proudly made in XCode
