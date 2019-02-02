## Stock Seer 股票价格在线预测工具  
一个利用 Ruby on Rails 搭建的超轻量级股票价格预测工具， 采用Tushare和LSTM神经网络进行股票数据的获取和预测
## Online Demo
访问[Stock Seer](...)查看在线演示。  
![网站首页](https://github.com/9kalikali/Algorithm_Course/blob/master/Others/demo1.png)
![股价预测与评估页面](https://github.com/9kalikali/Algorithm_Course/blob/master/Others/demo2.png)
测试用账号：
>username: test0@stock.com  
>password: test0test0

使用步骤：
1. 注册并登录
2. 根据股票代码查询股票
3. 点击相应股票，查看价格预测与评估  
## Usage
1. **项目的配置与部署**
   + 确保自己的服务器上已安装了Ruby, Rails以及数据库，详情请参考[《在Aliyun上快速部署Ruby on Rails》](https://ruby-china.org/topics/17553)
   + 下载项目到服务器`git clone https://github.com/zyqSE/stock.git`
   + 创建项目中忽视的存放数据的文件夹
   ```
   $ cd stock/app/controllers/temp
   $ mkdir data
   $ cd data
   $ mkdir history evaluate future
   ```
   + 安装项目  
   ```
   $ cd stock
   $ bundle install
   #创建生产环境数据库并执行迁移
   $ RAILS_ENV=production rake db:create  
   $ RAILS_ENV=production rake db:migrate
   $ RAILS_ENV=production rake db:seed
   #重新compile assets 这样CSS, script资源才会加载
   $ RAILS_ENV=production rake assets:precompile
   ```
   + 配置定时清理程序，利用`crontab -e`添加定时任务即可（建议每天00:01分执行清理）清理脚本路径`stock/app/controllers/temp/cleanup.sh`
   + 启动应用  
   ```
   $ cd stock
   $ myrails     #默认80端口
   ```
2. **TuShare安装**
   + 安装python
   + 安装pandas
   + 建议安装Anaconda（若没安装Anaconda， 请单独安装lxml）
   + 本体安装：方式1 `pip install tushare`; 方式2 访问[这里](https://pypi.python.org/pypi/Tushare/)下载安装
   + 版本查看
    ```
    import tushare
    print(tushare.__version__)
    ```
3. **预测模型的安装**
   + 安装python 3.5.x, TensorFlow 1.10.0, Numpy 1.15.0, Keras 2.2.2, Matplotlib 2.2.2
   + fork项目到服务器 `git clone https://github.com/jaungiers/LSTM-Neural-Network-for-Time-Series-Prediction.git`
## Todo
1. 股价评估的雷达图显示效果较差，欲寻找一种更合适的可视化方案
2. 添加用户浏览历史以及收藏功能。
## Reference & Support
+ Logo制作：[DesignEVO在线Logo制作](https://www.designevo.com/cn/)
+ 财经数据获取：[TuShare财经数据接口包](http://tushare.org/)
+ 服务器配置与部署：[如何在Ubuntu云服务器上部署自己的 Rails 应用](https://ruby-china.org/topics/32851)
+ LSTM神经网络预测模型 [LSTM Neural Network for Time Series Prediction](https://github.com/jaungiers/LSTM-Neural-Network-for-Time-Series-Prediction)
