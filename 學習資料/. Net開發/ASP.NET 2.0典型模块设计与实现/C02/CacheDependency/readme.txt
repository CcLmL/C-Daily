ע�����ݿ�Ļ��������Ǹ����鷳�����⣬ͨ��ʹ��aspnet_regsql.exe�Ŀ��ӻ�������ɣ�����Щʱ�򣬳����Ǳ���û����ע��ɹ��ȡ�����
Ϊ�˷����������ã����ܽ��һ���Ƚϼ򵥵ķ�����ϣ����������������
��1�������������ݿ�������
aspnet_regsql.exe -S ".\SQLExpress" -E -d "AdventureWorks" -ed
��2���������������ݱ�
aspnet_regsql.exe -S ".\SQLExpress" -E -d "AdventureWorks" -et -t "aspnet_Users"
��3����Web.Config�ļ�������
		<caching>
			<sqlCacheDependency enabled="true" pollTime="1000">
				<databases>
					<add connectionStringName="AdventureWorksConnectionString" name="AdventureWorks" pollTime="1000" />
				</databases>
			</sqlCacheDependency>
		</caching>


��ʱ�������ݿ����Ȩ�޵����⣬�����Ȼû��ע��ɹ��������Լ��ĵ�¼Ȩ�ޡ�