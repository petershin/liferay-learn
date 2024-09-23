---
taxonomy-catagory-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: 17cb9c59-8bc8-4a50-a985-632a1d872421
---

# Understanding Transfer Strategies

{bdg-link-primary}`[Google Cloud Storage](https://cloud.google.com/storage)`

When restoring a SFS (Simple File System) backup on GCS (Google Cloud Storage), you must choose a transfer strategy. The backup service supports two transfer strategies for the document library: `gsutil` and `rclone`. You can choose the desired transfer strategy using the `LCP_DOCUMENT_LIBRARY_GCS_TRANSFER_STRATEGY` environment variable. By default, the backup service uses `gsutil` to ensure backups run smoothly on Liferay DXP version that don't support `rclone`.

!!! warning
    `gsutil` is no longer supported in Liferay. If you run into issues while using it, change the document library transfer strategy to `rclone`.

## Using `rclone` as the Transfer Strategy

{bdg-secondary}`Liferay DXP 2024.Q1.6+`
{bdg-secondary}`Backup Service 5.17.0+`

!!! note
    Rclone is faster, lighter, and less error-prone than `gsutil` as a backup transfer strategy. Always use `rclone` if your Liferay DXP version supports it.

When using `rclone`, you can control how the transfer is done through different configuration options. You can configure these options through environment variables:

| Name                   | Default Value | Description                                                                                                                                                                                                                                     |
| :--------------------- | :------------ | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RCLONE_CHECKERS`      | `256`         | Sets the number of checkers to run during a sync. Checkers run equality checks on the files as they are transferred to ensure they are not improperly modified. It's recommended to set this to at least the same number as `RCLONE_TRANSFERS`. |
| `RCLONE_TRANSFERS`     | `256`         | Sets the number of files to transfer simultaneously. Set this to a smaller number if you have few bandwith and are running into performance issues.                                                                                             |
| `RCLONE_FAST_LIST`     | false         | Enables `rclone`'s fast list strategy, which consumes more memory in exchange for fewer transactions.                                                                                                                                           |
| `RCLONE_DISABLE_HTTP2` | true          | Disables using HTTP/2. This usually speeds up transfers.                           |

!!! note
    See [`rclone`'s documentation](https://rclone.org/docs/) for more information on these configuration options.

## Discovering the Transfer Strategy

To ensure the backup service is using the desired transfer strategy, you can by viewing the backup service logs. After restoring a SFS backup on GCS, you should see a similar message:

```
Spawning [TRANSFER_STRATEGY] process to transfer files from [SOURCE] to [DESTINATION]
```

The command written in `[TRANSFER_STRATEGY]` is either `gsutil` or `rclone`.