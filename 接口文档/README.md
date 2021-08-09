# 接口文档说明

## api 网址 【后期上线会更换请勿写死】

http://bcrpc.xilewanggou.com/pay-api

### 对接接口网址

- 创建订单 http://bcrpc.xilewanggou.com/pay-api/trades/AopF2F
- 订单查询 http://bcrpc.xilewanggou.com/pay-api/trades/Query
- 订单退款 http://bcrpc.xilewanggou.com/pay-api/trades/Refund
- 退款查询 http://bcrpc.xilewanggou.com/pay-api/trades/RefundQuery

具体请求参数请查阅 trade.proto 文档

### sign 加密校验说明

```
采用RSA2加密 请使用PKCS1不支持PKCS8
秘钥生成可以使用支付宝秘钥生成工具
```

#### 请求加密数据 生成 sign

全部请求数据(不包括 sign) 正序排列后 json 转 string 生成 sign

#### 返回加密数据 生成 sign

返回数据数据 content 值 正序排列后 json 转 string 生成 sign 进行校验

#### 请求例子

```
{
    "appId":    "1626945258ef4f2239d3a0",
	"signType": "RSA2",
	"bizContent": {
		"authCode":   "287359201063620602",
		"title":      "IcbcAlipay扫码支付",
		"outTradeNo": "GZ2020010117534314525",
		"totalFee":   "2",
		"operatorId": "0001",
		"terminalId": "9008",
		"attach":     "ceshi"
	},
	"sign": "sign"
}
```
