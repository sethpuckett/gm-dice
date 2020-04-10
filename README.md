# GM Tools: Dice API

The Dice API is used to simulate dice rolls for roll playing games. It is part of the [GM Tools](https://github.com/sethpuckett/gm-tools-docker) suite of services. See that repository for setup instructions.

## Endpoints

- `GET /dice/roll`

### Query string parameters

- `count`: The number of dice to roll; integer between `1 - 100`
- `sides`: The number of sides of the dice ro roll; integer values: `4`, `6`, `8`, `10`, `12`, `20`, `100`
- `constant`: The constant value to add to the total dice roll; integer between `-1,000,000 - 1,000,000`
- `attempts`: The number of dice rolls to return; if this is greater than `1` the response will be an array of rolls

### Default Parameters
All query string parameters are optional. These default values will be used if the parameters are absent in the request.

- `count`: 1
- `sides`: 6
- `constant`: 0
- `attempts`: 1

This is equivalent to rolling a single six-sided die.

### Response Parameters

- `total`: the sum total of the roll
- `values`: the value of each individual die
- `constant`: the constant value that was applied to the roll

### Examples

- 5d8: `GET /dice/roll?count=5&sides=8`
```
{
  "total": 27,
  "values": [
    7,
    8,
    5,
    1,
    6
  ],
  "constant": 0
}
```
- 2d6 + 5: `GET /dice/roll?count=2&sides=6&constant=5`
```
{
  "total": 16,
  "values": [
    5,
    6
  ],
  "constant": 5
}
```
- 1d20 with advantage: `GET /dice/roll?count=1&sides=20&attempts=2`
```
[
  {
    "total": 10,
    "values": [
      10
    ],
    "constant": 0
  },
  {
    "total": 13,
    "values": [
      13
    ],
    "constant": 0
  }
]
```

Passing invalid parameter values to the API will result in a `422 Unprocessable Entity` response.