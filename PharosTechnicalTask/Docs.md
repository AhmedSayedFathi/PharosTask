//
//  Docs.md
//  PharosTechnicalTask
//
//  Created by Ahmed Sayed Fathi on 16/08/2023.
//

## Pharos Technical Task Project Documentation

### Overview

The Pharos Technical Task Project is a Swift-based application that simulates the fluctuation of stock prices over time. The project consists of various components that work together to create a realistic simulation of stock market behavior.

### Main Components

#### `StockSimulator`

The `StockSimulator` class is responsible for managing the simulation of stock prices. It holds an array of `StockInfo` objects and uses a timer to periodically update the stock prices based on random changes.

- **Properties**:
  - `stocks`: An array of `StockInfo` objects representing the simulated stocks.
  - `timer`: A timer used for scheduling stock price updates.

- **Methods**:
  - `init()`: Initializes the `StockSimulator` object and populates it with initial stock data.
  - `startSimulation()`: Starts the simulation by scheduling periodic stock price updates.
  - `stopSimulation()`: Stops the simulation by invalidating the timer.
  - `simulateStockChanges()`: Updates the stock prices and related information based on random changes.

#### `FetchStockListUseCase`

The `FetchStockListUseCase` protocol defines an interface for fetching the list of stock information.

- **Methods**:
  - `execute(completion:)`: Fetches the list of stock information and invokes the provided completion block with the fetched data.

#### `FetchStockListUseCaseImpl`

The `FetchStockListUseCaseImpl` class implements the `FetchStockListUseCase` protocol. It utilizes the `StockSimulator` to provide simulated stock data.

- **Methods**:
  - `init()`: Initializes the use case by starting the stock simulation.
  - `startStockSimulation()`: Initializes a timer for periodic stock simulation updates.
  - `simulateStockChanges()`: Invokes the `simulateStockChanges()` method on the `StockSimulator`.
  - `execute(completion:)`: Fetches the simulated stock data and calls the completion block.

#### `StockInfo` and `StockDirection`

The `StockInfo` struct represents the information about a stock, including its name, price, change direction, and change value. The `StockDirection` enum defines the possible directions of stock price changes (up, down, or stable).

- **Properties**:
  - `name`: The name of the stock.
  - `last`: The last recorded price of the stock.
  - `time`: The time of the last recorded price.
  - `changeDirection`: The direction of the stock price change (up, down, or stable).
  - `changeValue`: The value of the stock price change.
  - `directionImageName`: The image name corresponding to the change direction.
  - `directionImageTint`: The tint color for the change direction image.

#### `StockListPresenter`

The `StockListPresenter` protocol defines an interface for managing the presentation of stock data in a list.

- **Methods**:
  - `attach(view:)`: Attaches a view to the presenter.
  - `numberOfItems() -> Int`: Returns the number of stock items.
  - `configure(cell:for:)`: Configures a cell with stock data for a given index path.

#### `StockListPresenterImpl`

The `StockListPresenterImpl` class implements the `StockListPresenter` protocol. It fetches stock data and manages the presentation logic for a list of stocks.

- **Methods**:
  - `attach(view:)`: Attaches a view to the presenter.
  - `startFetchingStocks()`: Initializes a timer for periodic stock data fetching.
  - `fetchStocks()`: Fetches stock data using the `FetchStockListUseCase`.
  - `updateStocks(stocks:)`: Updates the presenter's stock data and notifies the view.
  - `numberOfItems() -> Int`: Returns the number of stock items.
  - `configure(cell:for:)`: Configures a cell with stock data for a given index path.

#### `StockListVC`

The `StockListVC` class is a view controller responsible for displaying the list of stocks.

- **Properties**:
  - `tableView`: A UITableView for displaying the list of stocks.
  - `presenter`: An instance of `StockListPresenter` that manages the presentation logic.

- **Methods**:
  - `viewDidLoad()`: Initializes the view controller and sets up the views.
  - `setupViews()`: Sets up the initial view properties.
  - `setupTableView()`: Registers table view cells and headers.
  - `tableView(_:numberOfRowsInSection:) -> Int`: Returns the number of rows in the table view.
  - `tableView(_:cellForRowAt:) -> UITableViewCell`: Configures and returns a cell for a given index path.
  - `tableView(_:viewForHeaderInSection:) -> UIView?`: Returns a custom header view for the table view.
  - `tableView(_:heightForRowAt:) -> CGFloat`: Returns the height of a table view cell.
  - `tableView(_:heightForHeaderInSection:) -> CGFloat`: Returns the height of a header view.

#### `StockListView`

The `StockListView` protocol defines an interface for updating the view with new stock data.

- **Methods**:
  - `reloadData()`: Reloads the view data.

### Design Pattern and Architecture

The project is structured following the Model-View-Presenter (MVP) design pattern. This pattern separates the application into three main components: 

- **Model**: Represents the data and business logic.
- **View**: Displays the user interface and forwards user interactions to the Presenter.
- **Presenter**: Handles the presentation logic, communicates with the Model to retrieve data, and updates the View accordingly.

In addition to the MVP pattern, the project incorporates concepts from the Clean Architecture. This architecture promotes the separation of concerns, maintainability, and testability by structuring the application into layers, with each layer having its own specific responsibility.

The Clean Architecture principles include:

- **Use Cases**: The project employs Use Cases to encapsulate business logic and use case-specific functionality. This enhances modularity and testability, allowing easy changes to the business rules without affecting other parts of the application.

- **Dependency Rule**: Higher-level layers depend on lower-level layers. This means that the innermost layers, such as Use Cases, do not have dependencies on the outer layers. This promotes a clear separation of concerns and eases the introduction of changes.

By adopting these design principles, the Stock Price Simulation project ensures a well-structured and maintainable codebase, making it easier to extend, modify, and test different parts of the application.

### Project Dependencies and Requirements

The Stock Price Simulation project is designed to be lightweight and self-contained. It does not have any external dependencies or requirements for third-party libraries. As a result, you can easily integrate and run the project without the need to manage additional dependencies.

### Minimum iOS Version Requirement

To run the Stock Price Simulation project on a real iOS device, the minimum iOS version required is 15.1. This version ensures compatibility with the project's codebase and its utilization of specific features and APIs introduced in iOS 15.1.


