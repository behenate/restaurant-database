USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[ParametersHistory]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParametersHistory](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[ValidFrom] [date] NOT NULL,
	[ValidTo] [date] NULL,
	[ParameterValue] [int] NOT NULL,
	[ParameterID] [int] NOT NULL,
 CONSTRAINT [PK_TimedDiscountsHistory] PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ParametersHistory]  WITH CHECK ADD  CONSTRAINT [FK_TimedDiscountsHistory_TimedDiscountsParameters] FOREIGN KEY([ParameterID])
REFERENCES [dbo].[DiscountsParameters] ([ParameterID])
GO
ALTER TABLE [dbo].[ParametersHistory] CHECK CONSTRAINT [FK_TimedDiscountsHistory_TimedDiscountsParameters]
GO
ALTER TABLE [dbo].[ParametersHistory]  WITH CHECK ADD  CONSTRAINT [CK_TimedDiscountsHistory] CHECK  (([ValidFrom]>'01-01-1900' AND [ValidTo]>=getdate()))
GO
ALTER TABLE [dbo].[ParametersHistory] CHECK CONSTRAINT [CK_TimedDiscountsHistory]
GO
