注册数据库的缓存依赖是个很麻烦的问题，通常使用aspnet_regsql.exe的可视化工具完成，但有些时候，程序还是报错：没有其注册成功等。。。
为了方便您的配置，现总结出一个比较简单的方法，希望对您有所帮助：
（1）首先启用数据库依赖：
aspnet_regsql.exe -S ".\SQLExpress" -E -d "AdventureWorks" -ed
（2）启用依赖的数据表
aspnet_regsql.exe -S ".\SQLExpress" -E -d "AdventureWorks" -et -t "aspnet_Users"
（3）在Web.Config文件中配置
		<caching>
			<sqlCacheDependency enabled="true" pollTime="1000">
				<databases>
					<add connectionStringName="AdventureWorksConnectionString" name="AdventureWorks" pollTime="1000" />
				</databases>
			</sqlCacheDependency>
		</caching>


有时候还有数据库访问权限的问题，如果依然没有注册成功，请检查自己的登录权限。