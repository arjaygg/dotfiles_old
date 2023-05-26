abbr -a vi nvim
abbr -a uat-start-ssm aws ssm start-session --target "i-0405a99d1708dcc98" --document-name AWS-StartPortForwardingSession --parameters portNumber="3310",localPortNumber="3309"
abbr -a dev-start-ssm aws ssm start-session --target "i-0f2eed4d296289844" --document-name AWS-StartPortForwardingSession --parameters portNumber="13306",localPortNumber="3306"
abbr -a devaws aws ssm start-session --target "i-0f2eed4d296289844" --document-name AWS-StartPortForwardingSession --parameters portNumber="13306",localPortNumber="3306"
abbr -a pprod-start-ssmaws ssm start-session --target "i-0405a99d1708dcc98" --document-name AWS-StartPortForwardingSession --parameters portNumber="3306",localPortNumber="3308"
abbr -a login-aws aws-azure-login --profile default --no-prompt
abbr -a loginaws aws-azure-login --profile default --no-prompt
abbr -a tel telepresence
abbr -a telc telepresence connect
abbr -a teli telepresence intercept
abbr -a telq telepresence quit -s
abbr -a tellst telepresence list
